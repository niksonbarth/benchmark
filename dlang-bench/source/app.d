import vibe.vibe;
import vibe.core.log;
import std.conv;


int fib(int n)
{
	if (n <= 1)
		return n;
	return fib(n - 1) + fib(n - 2);
}

void handleRequest(HTTPServerRequest req, HTTPServerResponse res)
{
	if (req.path == "/bench")
	{
		res.writeJsonBody([ "message": fib(15) ]);
	}
}

void main()
{
	listenHTTP("0.0.0.0:8000", &handleRequest);
	runApplication();
}
