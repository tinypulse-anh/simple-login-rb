module WebApiHelper
  STATUS_CODES = {
    OK:           200,
    FAILED:       400,
    UNAUTHORIZED: 401,
    FORBIDDEN:    403,
    NOT_FOUND:    404,
    ERROR:        500,
    CREATED:      201
  }.freeze
  OK_STATUS = :OK

  def api_respond_ok(response_hash = {})
    web_api_respond(:OK, response_hash)
  end

  def api_respond_failed(response_hash = {})
    web_api_respond(:FAILED, response_hash)
  end

  def api_respond_unauthorized(response_hash = {})
    web_api_respond(:UNAUTHORIZED, response_hash)
  end

  def api_respond_forbidden(response_hash = {})
    web_api_respond(:FORBIDDEN, response_hash)
  end

  def api_respond_not_found(response_hash = {})
    web_api_respond(:NOT_FOUND, response_hash)
  end

  def api_respond_error(response_hash = {})
    web_api_respond(:ERROR, response_hash)
  end

  def api_respond_created(response_hash = {})
    web_api_respond(:CREATED, response_hash)
  end

  private

  def web_api_respond(status, response_hash)
    response = { status: status }
    response = response.merge(response_hash) if response_hash
    render json: response, status: STATUS_CODES[status]
  end
end
