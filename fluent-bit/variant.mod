provisioners:
  files:
    Dockerfile:
      source: Dockerfile.tpl
      arguments:
        fluentbit_version: "{{ .fluentbit.version }}"
        fluentbit_s3_version: "{{ .s3.version }}"
        fluentbit_cloudwatch_version: "{{ .cloudwatch.version }}"

dependencies:
  fluentbit:
    releasesFrom:
      dockerImageTags:
        source: fluent/fluent-bit
    version: "> 0.1"
  s3:
    releasesFrom:
      githubReleases:
        source: cosmo0920/fluent-bit-go-s3
    version: "> 0.1"
  cloudwatch:
    releasesFrom:
      githubReleases:
        source: aws/amazon-cloudwatch-logs-for-fluent-bit
    version: "> 0.1"