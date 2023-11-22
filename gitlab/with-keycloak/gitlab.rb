gitlab_rails['omniauth_enabled'] = true
gitlab_rails['omniauth_allow_single_sign_on'] = ['openid_connect']
gitlab_rails['omniauth_block_auto_created_users'] = true
letsencrypt['enable'] = false
gitlab_rails['trusted_certs_dir'] = '/etc/gitlab/trusted-certs'
gitlab_rails['omniauth_providers'] = [{
    name: 'openid_connect',
    label: 'Keycloak', 
    icon: 'https://upload.wikimedia.org/wikipedia/commons/2/29/Keycloak_Logo.png',
    args: {
        name: 'openid_connect',
        scope: ["openid","profile","email"],
        response_type: "code",
        discovery: true,
        pkce: false,
        uid_field: "preferred_username",
        client_auth_method: "query",
        issuer: "https://keycloak:8443/realms/polytech",
        client_options: {
            ssl: {
                ca_file: "/etc/gitlab/trusted-certs/keycloak.crt",
            },
            identifier: "gitlab",
            secret: "secret",
            redirect_uri: "http://gitlab/users/auth/openid_connect/callback",
            verify_ssl: true,
        }
    },
}]
