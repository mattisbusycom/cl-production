# REST API
==========

## Protocol Details

Authentication
--------------
By default all REST endpoints assume anonymous access and filter results to correspond to what anonymous users can read (which may be nothing at all).

To authenticate, prefix the endpoint URL with /a/.  

    a) For example to authenticate to /briefcases/ request URL /a/briefcases.

    b) For example to authenticate to /projects/ request URL /a/projects..

Preconditions
-------------
## PUT (Create New Resource)
- Clients can request PUT to create a new resource and not overwrite an existing one.
choice dependent on flow state possibly.


If-None-Match: *
----------------
Clients can also add `If-None-Match: *` to their HTTP Request Header 

### Implementation
1. Clients MUST add If-None-Match: * to the request HTTP headers.
upon a PUT request to the authenticated (usually authenticated) endpoint of selection/use/

### Response
If the named resource already exists on the server, the server MSUT respond with HTTP `412 Precondition Failed`


