;serialized-exchange invokes (serializer1 (serializer2 exchange)), and in turn exchange invokes (account1 'withdraw), which gets blocked until the first call finished, which never happens.
