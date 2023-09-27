# workshop-timeseries-csv
Example about an IRIS production using IntegratedML Time Series capabilities to get predictions about the passengers for the "Metro de Valencia" subway system.

You can find more in-depth information in https://learning.intersystems.com.

New to IRIS Interoperability framework? Have a look at [IRIS Interoperability Intro Workshop](https://github.com/intersystems-ib/workshop-interop-intro).

# What do you need to install? 
* [Git](https://git-scm.com/downloads) 
* [Docker](https://www.docker.com/products/docker-desktop) (if you are using Windows, make sure you set your Docker installation to use "Linux containers").
* [Docker Compose](https://docs.docker.com/compose/install/)
* [Visual Studio Code](https://code.visualstudio.com/download) + [InterSystems ObjectScript VSCode Extension](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript)

# Setup
Build the image we will use during the workshop:

```console
$ git clone https://github.com/intersystems-ib/workshop-timeseries-csv
$ cd workshop-timeseries-csv
$ docker-compose build
```

# Example

The main purpose of this example is to get predictions about the number of passengers in the following three months. We are going to build our table to train the model using the data of passengers by line for the previous 6 years. To feed our system with these data we are going to use the Record Mapper functionality of IRIS to import these data from a CSV file.



## Test Production 
* Run the containers we will use in the workshop:
```
docker-compose up -d
```
Automatically an IRIS instance will be deployed and a production will be configured and run available to import data, create the prediction model and train it.

* Open the [Management Portal](http://localhost:52774/csp/sys/UtilHome.csp).
* Login using the default `superuser`/ `SYS` account.
* Click on [Test Production](http://localhost:52774/csp/user/EnsPortal.ProductionConfig.zen?$NAMESPACE=MLTEST&$NAMESPACE=MLTEST&) to access the sample production that we are going to use. You can access also through *Interoperability > User > Configure > Production*.
* Click on *CSVIn* Business Service and review the configuration, check the input folder.
* Click on *PredictionModelGeneration* and check the Business Process associated *MLTEST.BP.PopulateTable* you will see the activities that populate the tables for the training with the raw data and the creation and training of the model. Finally a Business Operation will be invoked to generate a CSV file with the prediction under */shared* folder.
* Business Operation *PredictionToCSV* is using classes developed by Evgeny Shvarov (thank you!) that simplify the CSV generation from a SQL command.
* To launch the process you only have to copy *totals.csv* and paste it into */shared/csv/newIn* from Visual Studio Code.
