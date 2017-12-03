# OTPApplications3

Result:

```
iex(1)> OTPApplications3.Server.next_number
"The next number is 456"
iex(2)> OTPApplications3.Server.increment_number 100
:ok
iex(3)> OTPApplications3.Server.next_number
"The next number is 557"
iex(4)> OTPApplications3.Server.next_number
"The next number is 657"
iex(5)> OTPApplications3.Server.fuck
:ok
iex(6)>
22:16:37.163 [error] GenServer OTPApplications3.Server terminating
** (RuntimeError) fuck up
    (otp_applications_3) lib/otp_applications_3/server.ex:51: OTPApplications3.Server.handle_cast/2
    (stdlib) gen_server.erl:616: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:686: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", {:fuck, 1}}
State: %OTPApplications3.Server.State{current_number: 757, delta: 100, stash_pid: #PID<0.192.0>}
iex(6)> OTPApplications3.Server.next_number
"The next number is 757"
iex(7)> OTPApplications3.Server.next_number
"The next number is 857"
iex(8)>
```