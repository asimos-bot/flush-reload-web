(module
    (import "env" "memory" (memory 2106 2106 shared))
    (func (export "counter") ;; load value at offset to the stack, add it to 1 and store the result back at 4096
        (loop $counter_loop 
            i32.const 256
            i32.const 256
            i32.load
            i32.const 1
            i32.add
            i32.store

            (; i32.const 256 ;)
            (; i32.const 1 ;)
            (; i32.atomic.rmw.add ;)

            (; i32.const 256 ;)
            (; i32.const 256 ;)
            (; i32.atomic.load ;)
            (; i32.const 1 ;)
            (; i32.add ;)
            (; i32.atomic.store ;)

            br $counter_loop
        )
    )
)
