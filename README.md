# Band Name

It is a project in Flutter, in which I want to practice and combine the knowledge of Sockets, real time communication and some styling.

The project simulates a vote among the best musical bands in the world, you can add a new band, remove a band and vote for one. Everything is done in real time and the data is changing.

To install/run the project:

1. Clone the project
2. In the ```lib/services/socket_service.dart``` file, you must change the connection to the local server to your ip. For example http://12.12.3.1:3000. This is to make it work on iOS.
3. Install the pub with the command ```` flutter pub get```.
4. Run the ```flutter run``` command.

The project to run the backend is located in the following repository:

- [Backend Project](https://github.com/jorgekast18/band-name-server)

To run the backend project you must take into account the following:

1. Create a file in the root of the project called .env
2. Inside the file add an environment variable ```PORT=3000``` or the number of the port you want. Note that you must put this same port in the socket_service.dart file.
3. Run the command ```npm run start:dev```.

![Home](https://i.postimg.cc/Xqx007H1/temp-Image-E1je-Ai.avif)
![Home](https://i.postimg.cc/dQ9FC4sR/temp-Image-HVvs-GW.avif)
![Home](https://i.postimg.cc/1381LSpM/temp-Imageo-Jg0z-T.avif)
![Home](https://i.postimg.cc/ZKKSxpnG/temp-Imagesrul-Xt.avif)
![Home](https://i.postimg.cc/hPyqyv7f/temp-Images-WA5d-P.avif)


TODO:

- [ ] Data persistence, create a database and save them.
- [ ] Create a login. 
- [ ] Animations when voting for a band.
