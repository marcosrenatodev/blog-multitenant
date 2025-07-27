require "test_helper"

#O que faz:
#Cria dois tenants em setup.
#Define temporariamente uma rota /_whoami que retorna Current.tenant.domain.
#Usa host! (Rack::Test) para simular requests em domínios diferentes.
#Verifica que o middleware encontra o tenant certo ou levanta erro.

class SetCurrentTenantTest < ActionDispatch::IntegrationTest
  setup do
    @tenant1 = Tenant.create!(name: "T1", domain: "t1.test",
                              site_title: "T1", default_description: "Desc")
    @tenant2 = Tenant.create!(name: "T2", domain: "t2.test",
                              site_title: "T2", default_description: "Desc")
    # Um controller simples pra expor Current.tenant no corpo
    Rails.application.routes.draw do
      get "/_whoami" => proc { |env|
        tenant = Current.tenant
        [200, { "Content-Type" => "text/plain" }, [tenant&.domain.to_s]]
      }
    end
  end

  teardown do
    Rails.application.reload_routes!  # volta às rotas originais
  end

  test "middleware sets Current.tenant by Host header" do
    host! "t1.test"
    get "/_whoami"
    assert_response :success
    assert_equal "t1.test", response.body

    host! "t2.test"
    get "/_whoami"
    assert_equal "t2.test", response.body
  end

  test "raises for unknown host" do
    host! "unknown.test"
    assert_raises(ActiveRecord::RecordNotFound) do
      get "/_whoami"
    end
  end
end
