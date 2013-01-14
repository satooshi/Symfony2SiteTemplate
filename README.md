Symfony2 Site Template
=================
Symfony2 boilarplate of following useful bundles.

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

## usage

    cd workspace
    git clone https://github.com/satooshi/Symfony2SiteTemplate.git YourApp
    cd YourApp
    ./bin/refresh-vendor.sh
    chmod -R a+w app/cache app/logs
    cp app.php index.php # for prod
    cp app_dev.php index.php # for dev

now you can start web server and access login page for admin site [http://localhost/admin/login](http://localhost/admin/login) 

