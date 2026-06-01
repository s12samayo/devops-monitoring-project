#!/bin/bash
set -euo pipefail

LOG_DIR="$(pwd)/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/monitor_$(date +%Y%m%d_%H%M%S).log"

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "MISSING: $1 is not installed" | tee -a "$LOG_FILE"
    exit 1
  fi
}

check_thresholds() {
  local cpu_load="$1"
  local disk_usage="$2"

  local cpu_int
  cpu_int=$(echo "$cpu_load" | cut -d. -f1)

  if [ "${cpu_int:-0}" -ge 90 ]; then
    echo "ALERT: CPU load is high: $cpu_load" | tee -a "$LOG_FILE"
  fi

  local disk_int
  disk_int=$(echo "$disk_usage" | tr -d '%')

  if [ "${disk_int:-0}" -ge 90 ]; then
    echo "ALERT: Disk usage is high: $disk_usage" | tee -a "$LOG_FILE"
  fi
}

{
  echo "===== SYSTEM HEALTH CHECK ====="
  date
  echo

  echo "Validating required commands..."
  require_cmd uptime
  require_cmd free
  require_cmd df
  require_cmd awk
  echo "OK: all required commands available"
  echo

  echo "CPU Load:"
  uptime
  echo

  echo "Memory Usage:"
  free -h
  echo

  echo "Disk Usage:"
  df -h
  echo

  cpu_load=$(awk '{print $1}' /proc/loadavg)
  disk_usage=$(df / | awk 'NR==2 {print $5}')
  check_thresholds "$cpu_load" "$disk_usage"

  echo "==============================="
} | tee -a "$LOG_FILE"

echo "Log written to: $LOG_FILE"
