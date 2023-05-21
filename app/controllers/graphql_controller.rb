class GraphqlController < ApplicationController
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # we need to provide session and current user
      session: session,
      current_user: current_user
    }
    result = BlogAppSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  # gets current user from token stored in the session
  def current_user
    # session[:token] is hardcoded because graphiql does not support it
    return unless session[:token]
    # session[:token] = "pMDek/K4pgzxy3yhmYIRxRRl4Mk=--8JMxFOtX2Hf6B0ur--9LKKtaORVFaYnZtJUvnDHQ=="

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    token = crypt.decrypt_and_verify session[:token]
    user_id = token.gsub('user-id:', '').to_i
    # the user is hardcoded until we will have got FE
    # User.first
    User.find(user_id)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end
end
