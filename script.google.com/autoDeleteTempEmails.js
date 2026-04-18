function autoDeleteTempEmails() {
  var searchQuery = 'in:inbox label:temp older_than:7d';
  var threads = GmailApp.search(searchQuery, 0, 100);
  for (var i = 0; i < threads.length; i++) {
    threads[i].moveToTrash();
  }
}
