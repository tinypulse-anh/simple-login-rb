# Simple session API in Ruby

## Instructions

- `bundle install -j8`
- `cp .env.sample .env` and change `DATABASE_URL` to point to TINYpulse dev db.
- `bundle exec rails s` _=> Listen to :3000 with 100 threads_

## Benchmarks

- Request: `GET http://localhost:3000/api/v1/sessions/new?username=khuyennguyen@test.com`
_(I have configured SSO login for that user to make the request more heavy.)_

### Concurrency = 1

```
> bombardier -c 1 -n 10000 http://localhost:3000/api/v1/sessions/new?username=khuyennguyen@test.com
Bombarding http://localhost:3000/api/v1/sessions/new?username=khuyennguyen@test.com with 10000 request(s) using 1 connection(s)
 10000 / 10000 [==================================================================] 100.00% 222/s 44s
Done!
Statistics        Avg      Stdev        Max
  Reqs/sec       223.52      64.38     355.18
  Latency        4.47ms     4.24ms   382.97ms
  HTTP codes:
    1xx - 0, 2xx - 10000, 3xx - 0, 4xx - 0, 5xx - 0
    others - 0
  Throughput:   112.92KB/s
```

### Concurrency = 100

```
> bombardier -c 100 -n 10000 http://localhost:3000/api/v1/sessions/new?username=khuyennguyen@test.com
Bombarding http://localhost:3000/api/v1/sessions/new?username=khuyennguyen@test.com with 10000 request(s) using 100 connection(s)
 10000 / 10000 [==================================================================] 100.00% 204/s 48s
Done!
Statistics        Avg      Stdev        Max
  Reqs/sec       205.55     102.83    1273.75
  Latency      486.57ms   462.83ms      5.67s
  HTTP codes:
    1xx - 0, 2xx - 9984, 3xx - 0, 4xx - 0, 5xx - 16
    others - 0
  Throughput:   137.24KB/s
```
