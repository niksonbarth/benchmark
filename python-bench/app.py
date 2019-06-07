from sanic import Sanic
from sanic.response import json
app = Sanic()

def fib(n):
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)

@app.route('/bench')
async def bench(request):
    return json({'message': fib(30)})

if __name__ == "__main__":
    app.run('0.0.0.0', 8000, workers=8, access_log=True)