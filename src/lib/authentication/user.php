<!--

  User caching system:
  Cache user data to session variable if not set yet to reduce loadtimes and strain on the database

  have two session variables: data and toUpdate
  check if data is set & toUpdate is false: no need to refetch user data
  if data isnot set of toUpdate is true: refetch user date

-->
