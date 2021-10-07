print('Start #################################################################');

db = db.getSiblingDB('cobranca_remessa');
db.createUser(
  {
    user: 'cr_user',
    pwd: 'voltz2021',
    roles: [{ role: 'readWrite', db: 'cobranca_remessa' }],
  },
);
db.createCollection('users');

print('END #################################################################');