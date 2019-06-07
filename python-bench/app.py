from sanic import Sanic
from sanic.response import json
from asyncio import sleep
from random import randint
app = Sanic()

@app.route('/bench')
async def bench(request):
    await sleep(randint(1,10))
    return json({'message': 'ok'})

if __name__ == "__main__":
    app.run('0.0.0.0', 8000, workers=8, access_log=True)