gitlab_rails['ldap_enabled'] = true # Active l’authentification via ldap
gitlab_rails['ldap_servers'] = { # Configure la connexion aux servers ldap
  'main' => { # Défini la configuration du serveur principal)
    'label' => 'LDAP',
    'host' =>  'openldap', # Ici nous nous trouvons dans le contexte de docker-compose, mais vous pouvez aussi bien mettre https://ldap.yourdomain.com ou une adresse IP
    'port' => 1389, # Le port auquel se connecter
    'uid' => 'uid',
    'bind_dn' => 'cn=admin,dc=example,dc=org',
    'password' => 'secret',
    'encryption' => 'plain',
    'verify_certificates' => false,
    'timeout' => 10,
    'active_directory' => false,
    'base' => 'dc=example,dc=org',
    'lowercase_usernames' => 'false',
    'retry_empty_result_with_codes' => [80],
    'allow_username_or_email_login' => true,
    'block_auto_created_users' => false
  }
}


