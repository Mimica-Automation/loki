{{/*
read fullname
*/}}
{{- define "loki.readFullname" -}}
{{ include "loki.name" . }}-read
{{- end }}

{{/*
read common labels
*/}}
{{- define "loki.readLabels" -}}
{{ include "loki.labels" . }}
app.kubernetes.io/component: read
{{- end }}

{{/*
read selector labels
*/}}
{{- define "loki.readSelectorLabels" -}}
{{ include "loki.selectorLabels" . }}
app.kubernetes.io/component: read
{{- end }}

{{/*
read priority class name
*/}}
{{- define "loki.readPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.read.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}


{{/*
read readiness probe
*/}}
{{- define "loki.read.readinessProbe" }}
{{- if .Values.read.readinessProbe }}
readinessProbe:
  {{- toYaml .Values.read.readinessProbe | nindent 2 }}
{{- else if .Values.loki.readinessProbe }}
readinessProbe:
  {{- toYaml .Values.loki.readinessProbe | nindent 2 }}
{{- end }}
{{- end }}

{{/*
read liveness probe
*/}}
{{- define "loki.read.livenessProbe" }}
{{- if .Values.read.livenessProbe }}
livenessProbe:
  {{- toYaml .Values.read.livenessProbe | nindent 2 }}
{{- else if .Values.loki.livenessProbe }}
livenessProbe:
  {{- toYaml .Values.loki.livenessProbe | nindent 2 }}
{{- end }}
{{- end }}

{{/*
read startup probe
*/}}
{{- define "loki.read.startupProbe" }}
{{- if .Values.read.startupProbe }}
startupProbe:
  {{- toYaml .Values.read.startupProbe | nindent 2 }}
{{- else if .Values.loki.startupProbe }}
startupProbe:
  {{- toYaml .Values.loki.startupProbe | nindent 2 }}
{{- end }}
{{- end }}