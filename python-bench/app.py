from sanic import Sanic
from sanic.response import json
from functools import lru_cache
app = Sanic()

def fib(n):
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)

@lru_cache(maxsize=10)
def fib2(n):
    if n <= 1:
        return n
    return fib2(n - 1) + fib2(n - 2)

@app.route('/bench')
async def bench(request):
    return json({'message': fib(30)})

@app.route('/bench2')
async def bench2(request):
    return json({'message': fib2(30)})

if __name__ == "__main__":
    app.run('0.0.0.0', 8000, workers=8, access_log=True)