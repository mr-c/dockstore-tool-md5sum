task md5 {
   File inputFile

   command {
     /bin/my_md5sum ${inputFile}
   }

  output {
    String value = read_string("md5sum.txt")
  }

  runtime {
    docker: "quay.io/briandoconnor/dockstore-tool-md5sum:1.0.0"
    cpu: 1
    memory: "512M"
  }
}

workflow ga4ghMd5 {
  call md5
}
