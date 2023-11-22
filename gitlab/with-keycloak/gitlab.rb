# Active OmniAuth
gitlab_rails['omniauth_enabled'] = true
# Définit OIDC comme le protocole à utiliser
gitlab_rails['omniauth_allow_single_sign_on'] = ['openid_connect']
# Empêche la création de comptes via Gitlab
gitlab_rails['omniauth_block_auto_created_users'] = true
gitlab_rails['omniauth_providers'] = [
  {
    'name': 'openid_connect',
    'label': 'Keycloak',
    'icon': 'https://upload.wikimedia.org/wikipedia/commons/2/29/Keycloak_Logo.png',
    'args': {
      'name': 'openid_connect',
      'scope': ['openid', 'profile'],
      'response_type': 'code',
      'discovery': true,
      'uid_field': 'preferred_username',
      'client_auth_method': 'query',
      'issuer': 'https://keycloak:8443/auth/realms/polytech',
      'client_options': {
        'identifier': 'gitlab',
        'secret': 'secret',
        'redirect_uri': 'https://keycloak:8443/users/auth/openid_connect/callback'
      }
    }
  }
]
