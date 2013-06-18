({
    name: "javascripts/main",
    out: "build/main-built.js",
    baseUrl: ".",
    //appDir: "./javascripts",
    //dir: "./build",
    optimize: "uglify2",
    preserveLicenseComments: false,
    optimizeCss: "standard",
    //removeCombined: true,
    //findNestedDependencies: true,

    pragmas: {
      debug: false
    },
    paths: {
      jquery: "components/jquery/jquery",
      leaflet: "components/leaflet/dist/leaflet",
      simpleModel: "components/simplemodal/jquery.simplemodal.1.4.4.min"
    },
    include: ["components/requirejs/require"]
})
