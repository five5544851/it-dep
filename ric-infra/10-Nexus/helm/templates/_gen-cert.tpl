################################################################################
#   Copyright (c) 2019 AT&T Intellectual Property.                             #
#   Copyright (c) 2019 Nokia.                                                  #
#                                                                              #
#   Licensed under the Apache License, Version 2.0 (the "License");            #
#   you may not use this file except in compliance with the License.           #
#   You may obtain a copy of the License at                                    #
#                                                                              #
#       http://www.apache.org/licenses/LICENSE-2.0                             #
#                                                                              #
#   Unless required by applicable law or agreed to in writing, software        #
#   distributed under the License is distributed on an "AS IS" BASIS,          #
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   #
#   See the License for the specific language governing permissions and        #
#   limitations under the License.                                             #
################################################################################i

{{/*
Generate certificates for the docker registry
*/}}
{{- define "nexus.gen-docker-cert" -}}
{{- $altNames := list ( include "common.ingressurl.localdocker" . ) -}}
{{- $ca := genCA "docker-registry-ca" 365 -}}
{{- $cert := genSignedCert ( include "common.ingressurl.localdocker" . ) nil $altNames 365 $ca -}}
tls.crt: {{ $cert.Cert | b64enc }}
tls.key: {{ $cert.Key | b64enc }}
{{- end -}}

{{- define "nexus.gen-helm-cert" -}}
{{- $altNames := list ( include "common.ingressurl.localhelm" . ) -}}
{{- $ca := genCA "docker-registry-ca" 365 -}}
{{- $cert := genSignedCert ( include "common.ingressurl.localhelm" . ) nil $altNames 365 $ca -}}
tls.crt: {{ $cert.Cert | b64enc }}
tls.key: {{ $cert.Key | b64enc }}
{{- end -}}


{{- define "nexus.gen-nexus-cert" -}}
{{- $altNames := list ( include "common.ingressurl.localnexus" . ) -}}
{{- $ca := genCA "docker-registry-ca" 365 -}}
{{- $cert := genSignedCert ( include "common.ingressurl.localnexus" . ) nil $altNames 365 $ca -}}
tls.crt: {{ $cert.Cert | b64enc }}
tls.key: {{ $cert.Key | b64enc }}
{{- end -}}