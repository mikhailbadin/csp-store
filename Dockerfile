FROM tarantool/tarantool:latest

COPY src /opt/tarantool
CMD ["tarantool", "/opt/tarantool/init.lua"]