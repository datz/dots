{
 :user {:plugins [[lein-kibit "0.0.8"]
                  [jonase/eastwood "0.1.4"]
                  [cider/cider-nrepl "0.8.2-SNAPSHOT"]
                  ]
        :dependencies [[slamhound "1.5.1"]
                       [im.chit/vinyasa "0.1.8"]]
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
