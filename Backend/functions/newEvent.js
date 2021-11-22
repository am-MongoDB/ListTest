exports = function(changeEvent) {
  
  let doc = changeEvent.fullDocument;
  
  console.log(`eventName: ${doc.eventName}`);
  if (doc.invitees) {
    console.log(`number of invitees: ${doc.invitees.length}`);
    if (doc.invitees.length > 0) {
      if (doc.invitees[0].username) {
        console.log(`First user: ${doc.invitees[0].username}`);
      } else {
        console.log(`username not set`);
      }
    }
  } else {
    console.log(`invitees not set`);
  }
};
