Symfony2 Web Site Template
=================
This is a Symfony2 boilerplate including the following useful bundles. 

* SonataUserBundle and its dependencies
    * FOS user bundle
* SonataAdminBundle and its dependencies
    * SonataBlockBundle
    * SonataCacheBundle
    * SonatajQueryBundle
    * SonataEasyExtendsBundle
    * SonataDoctrineORMAdminBundle
    * KnpMenuBundle
* SonataPageBundle and its dependencies
    * SonataIntlBundle
    * SonataSeoBundle
    * SonataNotificationBundle
    * SymfonyCmfRoutingExtraBundle
* SonataNewsBundle and its dependencies
    * SonataMediaBundle

And also including these libraries.

* [YUI compressor](http://developer.yahoo.com/yui/compressor/) [download the jar file](http://yuilibrary.com/projects/yuicompressor/)


## Introduction

Here are the bootstrap commands for your web site application. 

```sh
cd workspace
git clone https://github.com/satooshi/Symfony2SiteTemplate.git YourApp
cd YourApp
sh bin/refresh-vendor.sh
chmod -R 0777 app/cache app/logs
cp app.php index.php # for prod
cp app_dev.php index.php # for dev
```

Next, setup your environment through web configurator. Open [http://localhost/config.php](http://localhost/config.php) with a web browser and follow the instructions.

And then, you should run the following commands to create required tables, user records, and pages.

```sh
# create tables related to sonata page bundle sonata admin
php app/console doctrine:schema:create
php app/console doctrine:schema:update --force

#
# configure fos user bundle
#
# if you want to use fos user bunde instead of sonata user bundle, run this command
# and then, create your User, Group entity to src/Bundle/UserBundle/Entity/
# see official doc to get information in detail
# https://github.com/FriendsOfSymfony/FOSUserBundle/blob/master/Resources/doc/index.md
#php app/console generate:bundle --namespace=Application/Bundle/UserBundle --dir=src

#
# configure sonata user bundle
#
# this command has already been done in this boilerplate
# enable sonata user bundle on your application
#php app/console sonata:easy-extends:generate SonataUserBundle --dest=src

# create users
php app/console fos:user:create admin admin@example.com adminpass --super-admin
php app/console fos:user:create testuser test@example.com userpass

#
# configure sonata page bundle
# see official doc 
# http://sonata-project.org/bundles/page/master/doc/reference/getting_started.html
#
# this command has already been done in this boilerplate
# enable sonata page bundle on your application
#php app/console sonata:easy-extends:generate SonataPageBundle --dest=src

# create a default site
php app/console sonata:page:create-site --enabled=true --name=sample \
--locale=- --host=localhost --relativePath=/ --enabledFrom=now \
--enabledTo="+1 years" --default=1

# create default pages
php app/console sonata:page:update-core-routes --site=all

# create snapshots
php app/console sonata:page:create-snapshots --site=all

#
# configure sonata media bundle
# see official doc 
# http://sonata-project.org/bundles/media/master/doc/reference/installation.html
#
# this command has already been done in this boilerplate
# enable sonata media bundle on your application
#php app/console sonata:easy-extends:generate SonataMediaBundle --dest=src

# create upload dir
mkdir -p web/uploads/media
chmod -R 0777 web/uploads
```

Now you can start web server and open login page for admin site [http://localhost/admin/login](http://localhost/admin/login) .

If you want to get more information, see documentation of each bundle.

* [FOSUserBundle](https://github.com/FriendsOfSymfony/FOSUserBundle)
* [Sonata Project](http://sonata-project.org/bundles/)
* [SymfonyCmfRoutingExtraBundle](http://symfony.com/doc/master/cmf/bundles/routing-extra.html)




