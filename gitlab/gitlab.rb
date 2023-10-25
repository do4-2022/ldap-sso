gitlab_rails['omniauth_enabled'] = true
gitlab_rails['omniauth_allow_single_sign_on'] = ['openid_connect']
gitlab_rails['omniauth_block_auto_created_users'] = true
gitlab_rails['omniauth_providers'] = [{
    name: 'openid_connect',
    label: 'Keycloak', 
    icon: 'https://res.cloudinary.com/practicaldev/image/fetch/s--2MouDG3s--/c_imagga_scale,f_auto,fl_progressive,h_720,q_auto,w_1280/https://thepracticaldev.s3.amazonaws.com/i/dp51une42j0d8uas60cx.png',
    args: {
        name: 'openid_connect',
        scope: ["openid","profile","email"],
        response_type: "code",
        discovery: true,
        pkce: false,
        uid_field: "preferred_username",
        client_auth_method: "query",
        issuer: "http://keycloak:8080/auth/realms/polytech",
        client_options: {
            scheme: "http",
            identifier: "gitlab",
            secret: "secret",
            redirect_uri: "http://gitlab/users/auth/openid_connect/callback"
        }
    },
}]

nginx['enable'] = true
nginx['listen_port'] = 80
nginx['listen_https'] = false