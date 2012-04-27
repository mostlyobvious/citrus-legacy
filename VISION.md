Rationale
---------

Horrible experiences with existing solutions when given a specific use cases from my projects. A beefy machine out there to saurate and some great concepts from TDDium and Travis CI to be cherry-picked. And most importantly - fun to build on my own (also called NIH elsewhere).

Restrictions
------------

- vpn only (no auth)
- github only (github hooks, git vcs)
- threaded workers (spawn subprocess anyway)

Features
--------

- HTTP public API for frontend, cli, mobile and extensions
- notifications must use HTTP streaming and listen for events
- github autoconfiguration based on token
- live console based on websockets or event-source
- files layout friendly to filesystem after large number of builds
- sqlite for deloyment ease
- matrix builds
- cascading build steps (continous deployment)
- configure build in project repo (or even separate config for branch)
- builds isolated in LXC containers (no more messing with several ports and separate DBs)
- container template set up by Chef

Caveats
-------

- inpecting old build requires restoring execution environment
- notifications totally external, so is configuration for them
- github push endpoint - proxied inside vpn and restricted to specified adresses

Bonus
-----

- external service to collect stats from build failers
