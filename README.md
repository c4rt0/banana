# Private toolbox containers

## Why?
I had no idea how to start with the concept of uploading my private toolbox container build to quay.io for future use. 
Docs can be extensive, this repo shrinks all of the info to bare minimum.

## How to  on Silverblue?

1. Fork and clone this repo

2. Modify contents of `extra-packages` to yoiur liking

3. From within the directory run (change the path):
```
sudo podman build /var/home/adamsky/Code/c4rt0/toolbox/banana -f Containerfile -t banana
sudo toolbox create --image localhost/banana:latest
sudo toolbox enter banana-latest
```
Once on the container, check the:
`cat /etc/os-release`
also, try to run the `sl` command ;) 
Then:
`exit`

4. Now that your container is build correctly and works as expected...

5. Login to quay.io :
```
sudo podman login quay.io
Username: <username>
Password: <password>
Email: <email>
```
6. Display the freshly created container ID:
`sudo docker ps -al`

```
CONTAINER ID        IMAGE               COMMAND             CREATED
07f2065197ef        banana:latest                           31 seconds ago
```

To check image ID:

`podman images`

```
CONTAINER ID  IMAGE                    COMMAND               CREATED         STATUS        PORTS       NAMES
13848a803328  localhost/banana:latest  toolbox --log-lev...  21 seconds ago  Up 9 seconds              banana-latest
```

7. Copy the CONTAINER ID and commit changes to quay.io (my example):
`sudo podman commit 13848a803328 quay.io/apiaseck/banana`

8. Push changes to quay.io:
`sudo docker push quay.io/apiaseck/banana`

9. Once your image is uploaded, create it now locally:

```
sudo toolbox create --image quay.io/apiaseck/banana 
sudo toolbox enter banana
```

10. You are now using your personalized container uploaded to quay.io.

Au revoir!
[Git source 1](https://github.com/jlebon/pet)
[Git source 2](https://github.com/jbtrystram/toolbox/tree/main)
[Git source 3](https://github.com/containers/toolbox/blob/main/images/fedora/f39/Containerfile)
