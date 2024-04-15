db.createUser({
  user: 'myAppUser',
  pwd: 'myAppPassword',
  roles: [
    {
      role: 'readWrite',
      db: 'timesheet-mng-db',
    },
  ],
});

db.createCollection("mycollection");
