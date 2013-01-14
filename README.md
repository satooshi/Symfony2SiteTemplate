Symfony2 Site Template
=================
This template is Symfony2 boilerplate including the following useful bundles.

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

## Introduction

Here are the bootstrap commands for your web site application. 

    cd workspace
    git clone https://github.com/satooshi/Symfony2SiteTemplate.git YourApp
    cd YourApp
    ./bin/refresh-vendor.sh
    chmod -R a+w app/cache app/logs
    cp app.php index.php # for prod
    cp app_dev.php index.php # for dev

And then, you should run these commands to create required tables, user records, and pages.

    # sonata admin
    php app/console doctrine:schema:create
    php app/console doctrine:schema:update --dump-sql
    php app/console doctrine:schema:update --force

    # if you don't use sonata user bundle then run this command
    # and create your User, Group entity to src/Bundle/UserBundle/Entity/
    php app/console generate:bundle --namespace=Application/Bundle/UserBundle --dir=src

    # enable sonata user bundle and create sonata user
    php app/console sonata:easy-extends:generate SonataUserBundle --dest=src
    php app/console fos:user:create admin admin@example.com adminpass --super-admin
    php app/console fos:user:create testuser test@example.com userpass

    # enable sonata page bundle
    php app/console sonata:easy-extends:generate SonataPageBundle --dest=src

    # create tables related to sonata page bundle
    php app/console doctrine:schema:update --dump-sql
    php app/console doctrine:schema:update --force

    # create your default site
    php app/console sonata:page:create-site --enabled=true --name=sample --locale=- --host=localhost --relativePath=/ --enabledFrom=now --enabledTo="+1 years" --default=1
    php app/console sonata:page:update-core-routes --site=all
    php app/console sonata:page:create-snapshots --site=all

Now you can start web server and access login page for admin site [http://localhost/admin/login](http://localhost/admin/login) .

