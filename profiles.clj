{
 :user {:global-vars {*print-length* 100}
        :plugins [[lein-kibit "0.0.8"]
                  [jonase/eastwood "0.1.4"]
                  [cider/cider-nrepl "0.11.0-SNAPSHOT"]
                  [refactor-nrepl "2.0.0-SNAPSHOT"]]
        :dependencies [[org.clojure/clojure "1.7.0"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       [slamhound "1.5.5"]
                       [im.chit/vinyasa "0.1.8"]
                       [org.clojure/data.csv "0.1.3"]
                       [org.clojure/data.json "0.2.6"]]
        :injections [(require 'vinyasa.inject)
                     (vinyasa.inject/inject 'clojure.core '>
                                            '[[clojure.repl doc find-doc source]
                                              [clojure.pprint pprint pp]])]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :repl-options
        {:nrepl-middleware
          [cider.nrepl.middleware.classpath/wrap-classpath
           cider.nrepl.middleware.complete/wrap-complete
           cider.nrepl.middleware.info/wrap-info
           cider.nrepl.middleware.inspect/wrap-inspect
           cider.nrepl.middleware.stacktrace/wrap-stacktrace
           cider.nrepl.middleware.trace/wrap-trace
           ]}
        }
 }
