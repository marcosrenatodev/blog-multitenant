class SetCurrentTenant
  def initialize(app)
    @app = app
  end

  def call(env)
    req    = Rack::Request.new(env)
    domain = req.host
    tenant = Tenant.find_by!(domain: domain)
    Current.tenant = tenant
    @app.call(env)
  ensure
    Current.reset
  end
end
