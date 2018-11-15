module Api
    module V1 
        class UsersController <  ApplicationController
            def index
                users = User.all
                render json: {status: 'SUCCESS', message:'Usuarios carregados', data:users},status: :ok
            end

            def show
                users = User.where(id:params[:id],tipodeusuario:params[:tipodeusuario])
                render json: {status: 'SUCCESS', message:'Usuarios carregados', data:users},status: :ok
            end
            # create test {"nome":"Afonso","sobrenome":"Mateus","pasasword": "paoaisdp","email":"mk@gmail.com","endereco":"Rau mopa nº 69, MOPA,MIAP,CE","cpf":"06850887580","login":"69","matricula":"9090","tipodeusuario":"gestor"}
            
            def update
                if Login.exists?(token: params[:token])
                    user = User.find(params[:id])
                    if user.update_attributes(user_param)
                        render json: {status: 'SUCCESS', message:'Updated user', data:user},status: :ok
                    else
                        render json: {status: 'ERROR', message:'Error on update user', data:user.errors},status: :unprocessable_entity
                    end
                else
                    render json: {status: 'ERROR', message:'Must be Logged'},status: :unprocessable_entity
                end

            end

            def create
                if check_cpf(params[:cpf])
                    user = User.new(user_param)
                    if user.save
                        render json: {status: 'SUCCESS', message:'Created user', data:user},status: :ok
                    else
                        render json: {status: 'ERROR', message:'Error on create user', data:user.errors},status: :unprocessable_entity
                    end
                else
                    render json: {status: 'ERROR', message:'Error Invalid CPF'},status: :unprocessable_entity
                end
            end

            def destroy
                if Login.exists?(token: params[:token])
                    user = User.find(params[:id])
                    user.destroy
                    render json: {status: 'SUCESS', message:'Deleted user', data:user},status: :ok
                else
                    render json: {status: 'ERROR', message:'Must be Logged'},status: :unprocessable_entity
                end
            end

            private
            def user_param
                params.permit(:token,:id,:login,:tipodeusuario, :email, :password,:nome,:sobrenome,:cpf,:endereco)
            end

            def check_cpf(cpf=nil)
                return false if cpf.nil?
              
                nulos = %w{12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 00000000000 12345678909}
                valor = cpf.scan /[0-9]/
                if valor.length == 11
                  unless nulos.member?(valor.join)
                    valor = valor.collect{|x| x.to_i}
                    soma = 10*valor[0]+9*valor[1]+8*valor[2]+7*valor[3]+6*valor[4]+5*valor[5]+4*valor[6]+3*valor[7]+2*valor[8]
                    soma = soma - (11 * (soma/11))
                    resultado1 = (soma == 0 or soma == 1) ? 0 : 11 - soma
                    if resultado1 == valor[9]
                      soma = valor[0]*11+valor[1]*10+valor[2]*9+valor[3]*8+valor[4]*7+valor[5]*6+valor[6]*5+valor[7]*4+valor[8]*3+valor[9]*2
                      soma = soma - (11 * (soma/11))
                      resultado2 = (soma == 0 or soma == 1) ? 0 : 11 - soma
                      return true if resultado2 == valor[10] # CPF válido
                    end
                  end
                return false # CPF inválido
              end
            end
        end
    end
end