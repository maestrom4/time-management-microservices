db = db.getSiblingDB('mydatabase');

db.createUser({
  user: 'myUser',
  pwd: 'myPassword',
  roles: [{ role: 'readWrite', db: 'bundyDb' }],
});

db.mycollection.insert({ key: 'value' });
