1. Visual Studio Code must be "Run as Administrator" for working Terminal Commands.
2. Install Node.js
    ```
    https://nodejs.org/en/download/
    ```

3. Install Angular https://angular.io/cli 
    ```
    ng help
    ng generate --help
    ---
    ng new my-first-project
    cd my-first-project
    ng serve

    ```
4. We’ll want to install **Express for the server** and **node-postgres** (pg) to be able to connect to PostgreSQL.
    ```
       --express server and node-postgress
       npm i express pg    
    ```
5. To install pipenv, simply open a terminal and type the following command

    ```
    --depending on the environment, you will have to use
    --pip3 instead of pip (just once)
    pip install pipenv

    --initialize the virtual environment
    pipenv install -v

    --To activate this project's virtualenv, run pipenv shell.
    --Alternatively, run a command inside the virtualenv with 
    pipenv run.   
    ``` 
  
6. install Python packages
    ```
        pipenv install sqlalchemy psycopg2-binary   
    ```
    
# Setup Angular + Python + Flask — Full stack demo:
Install Python stable version
2. Install “pip” package. Download below file and execute it. It should install pip. (Don’t know what is pip? It is similar to “npm” or “NuGet” for Python packages)
https://bootstrap.pypa.io/get-pip.py
3. Update pip and setup tools — `pip install — upgrade pip setuptools`
4. Install virtual environment for pip— `pip install virtualenv`
5. Install flask — `pip install Flask`
6. Install flask helper packages — ` pip install flask flask-jsonpify flask-sqlalchemy flask-restful`    
