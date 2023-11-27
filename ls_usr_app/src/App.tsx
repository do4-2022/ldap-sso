import { GroupRepresentation, KeycloakAdminClient, UserRepresentation } from '@s3pweb/keycloak-admin-client-cjs';
import { useEffect, useState } from 'react';

import "./App.css";

async function getUsersFromRealm(): Promise<[UserRepresentation[], GroupRepresentation[]]> {
  const keycloakAdminClient = new KeycloakAdminClient({
    baseUrl: 'http://localhost:8080',
    requestOptions: {
      referrerPolicy: "no-referrer"
    }
  });

  await keycloakAdminClient.auth({
    username: 'admin',
    password: 'secret',
    grantType: 'password',
    clientId: 'admin-cli',
    totp: '123456', // optional Time-based One-time Password if OTP is required in authentication flow
  });

  keycloakAdminClient.setConfig({
    realmName: 'polytech',
  });

  return [
    await keycloakAdminClient.users.find(),
    await keycloakAdminClient.groups.find()
  ];
}

function App() {
  const [ groups, setGroups ] = useState<GroupRepresentation[] | null>(null);
  const [ users, setUsers ] = useState<UserRepresentation[] | null>(null);

  useEffect(() => {
    getUsersFromRealm().then(([users, groups]) => {
      setUsers(users);
      setGroups(groups);
    });
  })

  return (
    <div className="App">
      <header className="App-header">
        <h1>User List App</h1>
      </header>

      <div className="user-list">
        <h2>Users</h2>
        {
          users == null ? <h2>Loading</h2> : users.map(user => (
            <div key={user.id}>
              {user.username}
            </div>
          ))
        }
      </div>

      <div className="user-list">
        <h2>Groups</h2>
        {
          groups == null ? <h2>Loading </h2>: groups.map(group => (
            <div key={group.id}>
              {group.name}
            </div>
          ))
        }
      </div>
    </div>
  );
}

export default App;
