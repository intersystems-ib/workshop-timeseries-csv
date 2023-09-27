ARG IMAGE=containers.intersystems.com/intersystems/iris-ml-community:latest-cd
FROM $IMAGE

USER root

WORKDIR /opt/irisapp
RUN chown -R irisowner:irisowner /opt/irisapp

USER irisowner

# copy files to image
WORKDIR /opt/irisapp
#COPY --chown=irisowner:irisowner /iris/iris.script iris.script
COPY --chown=irisowner:irisowner src src

COPY --chown=$ISC_PACKAGE_MGRUSER:$ISC_PACKAGE_IRISGROUP /iris/irissession.sh /
RUN chmod +x /irissession.sh

SHELL ["/irissession.sh"]

RUN \
zn "%SYS" \
set sc = $SYSTEM.OBJ.LoadDir("/opt/irisapp/src/Test", "ck", , 1) \
if sc do ##class(Test.Installer).Install() \
do ##class(Security.SSLConfigs).Create("z") s r=##class(%Net.HttpRequest).%New(),r.Server="pm.community.intersystems.com",r.SSLConfiguration="z" d r.Get("/packages/zpm/latest/installer"),$system.OBJ.LoadStream(r.HttpResponse.Data,"c") \
zn "MLTEST" \
set sc = $SYSTEM.OBJ.LoadDir("/opt/irisapp/src/MLTEST", "ck", , 1) \
set sc = $SYSTEM.OBJ.LoadDir("/opt/irisapp/src/User", "ck", , 1) \
# start production
set production = "MLTEST.Production" \
set ^Ens.Configuration("csp","LastProduction") = production \
do ##class(Ens.Director).SetAutoStart(production) \
zpm "install csvgen" \
set sc = 1 