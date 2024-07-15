{{/*
Image Url image will be pushed to defaults to internal registry
*/}}
{{- define "image.url" -}}
{{- with .Values.image }}
{{- printf "%s/%s/%s:%s" .host .organization .name .tag }}
{{- end }}
{{- end }}