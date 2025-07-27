# test/integration/multitenant_auth_test.rb
require "test_helper"

class MultitenantAuthTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @p1 = Tenant.create!(name: "Pierre", domain: "pierre.test",
                         site_title: "Pierre", default_description: "Desc")
    @p2 = Tenant.create!(name: "Marcia", domain: "marcia.test",
                         site_title: "Marcia", default_description: "Desc")

    @u1 = User.create!(email: "admin@pierre.test",
                       password: "password", role: :admin, tenant: @p1)
    @u2 = User.create!(email: "admin@marcia.test",
                       password: "password", role: :admin, tenant: @p2)
  end

  test "pierre user cannot login on marcia site" do
    host! "marcia.test"
    post user_session_path, params: {
      user: { email: @u1.email, password: "password" }
    }
    # Devise por default redireciona de volta com alerta
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_match /Invalid Email or password/, response.body
  end

  test "each user logs in only on their own domain" do
    host! "pierre.test"
    post user_session_path, params: {
      user: { email: @u1.email, password: "password" }
    }
    follow_redirect!
    assert_equal "/", path

    # Agora tente o contrário
    host! "pierre.test"
    post user_session_path, params: {
      user: { email: @u2.email, password: "password" }
    }
    assert_redirected_to new_user_session_path
  end
end
