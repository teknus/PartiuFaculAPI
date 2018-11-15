module Api
    module V1 
        class HorariosController <  ApplicationController
            def index
                    horarios = Horario.all
                    render json: {status: 'SUCCESS', message:'Horarios carregados', data:horarios},status: :ok
            end

            def show
                horarios = Horario.where(diasemana:params[:diasemana],data:params[:data])
                render json: {status: 'SUCCESS', message:'Horarios carregados', data:horarios},status: :ok
            end

            def create
                 if Login.exists?(token: params[:token])
                    horario = Horario.new(horario_params)
                    if horario.save
                        render json: {status: 'SUCCESS', message:'Created horario', data:horario},status: :ok
                    else
                        render json: {status: 'ERROR', message:'Error on create horario', data:horario.errors},status: :unprocessable_entity
                    end
                else
                    render json: {status: 'ERROR', message:'Must be Logged'},status: :unprocessable_entity
                end
            end

            #Upadate só atualiza as presencas

            def update
                if Login.exists?(token: params[:token])
                    horario = Horario.find(params[:id])
                    presenca_value = params[:presenca].to_i + horario.presenca
                    params[:presenca] =  (presenca_value > 0 ? presenca_value : 0).to_s
                    if horario.update_attributes(horario_params)
                        render json: {status: 'SUCCESS', message:'Updated horario', data:horario},status: :ok
                    else
                        render json: {status: 'ERROR', message:'Error on update horario', data:horario.errors},status: :unprocessable_entity
                    end
                else
                    render json: {status: 'ERROR', message:'Must be Logged'},status: :unprocessable_entity
                end

            end

            def destroy
                if Login.exists?(token: params[:token])
                    horario = Horario.find(params[:id])
                    horario.destroy
                    render json: {status: 'SUCESS', message:'Deleted horario', data:horario},status: :ok
                else
                    render json: {status: 'ERROR', message:'Must be Logged'},status: :unprocessable_entity
                end
            end

            private
            def horario_params
                params.permit(:data, :presenca, :embarque, :turno,:diasemana)
            end
        end
    end
end