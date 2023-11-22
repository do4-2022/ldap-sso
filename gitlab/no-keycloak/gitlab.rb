# Active OmniAuth
gitlab_rails['omniauth_enabled'] = true
# Définit OIDC comme le protocole à utiliser
gitlab_rails['omniauth_allow_single_sign_on'] = ['openid_connect']
# Empêche la création de comptes via Gitlab
gitlab_rails['omniauth_block_auto_created_users'] = true
gitlab_rails['omniauth_providers'] = [{
  name: 'openid_connect',
  label: 'Keycloak',
  icon: '<lien ou bade64 icon>',
  args: {
    name: 'openid_connect',
    scope: ['openid', 'profile', 'email'],
    response_type: 'code',
    discovery: true,
    pkce: false,
    uid_field: 'preferred_username',
    client_auth_method: 'query',
    issuer: '<lien du keycloak>/auth/realms/<nom du realm keycloak>',
    client_options: {
      identifier: '<identifiant du client keycloak>',
      secret: '<secret du client keycloak>',
      redirect_uri: '<lien keycloak>/users/auth/openid_connect/callback'
    }
  }
}]
