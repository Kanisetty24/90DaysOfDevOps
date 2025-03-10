Troubleshooting Notes: Containerizing My Django App

While containerizing my Django app, I encountered a few issues and learned the following:
1. Docker Not Installed Initially

At first, my CI/CD pipeline was failing. The root cause?
I hadn’t installed Docker on the machine.
2. Docker Permission Issues

After installing Docker, I got permission errors when trying to run Docker commands.
Turns out, my Ubuntu user wasn’t part of the docker group.

Fix:

sudo usermod -aG docker $USER

3. distutils Module Not Found

I was using the python:3 image in my Dockerfile and got this error:

ModuleNotFoundError: No module named 'distutils'

Found out that distutils has been removed in Python 3.12.
So, I switched to python:3.10 in my Dockerfile.

4. Docker Cache Issue

Even after switching to Python 3.10, I was still getting the same distutils error.
Why? Docker was using the cached layer from the old image.
docker build --no-cache -t django-todo .

Fix:

docker build --no-cache -t django-todo .

5. Docker Desktop Glitch

After rebuilding with --no-cache, something still felt off.
Finally, I restarted Docker Desktop, and everything worked perfectly after that.
