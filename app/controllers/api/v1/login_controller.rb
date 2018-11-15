module Api
    module V1 
        class LoginController <  ApplicationController
            def update
                user = User.find_by(login: params[:login])
                if user.present?
                    if user.password == params[:password]
                        token = SecureRandom.uuid
                        log = Login.new(token: token.to_s)
                        if log.save
                            render json: {status: "SUCCESS",message: "Logged", data: token},status: :ok
                        end
                    else
                        render json: {status: "ERROR",message: "Error on login",data:user.erros},status: :unprocessable_entity
                    end
                end
            end
        end
    end
end