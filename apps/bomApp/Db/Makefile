TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install)
# databases, templates, substitutions like this
##DB += dbExample1.db
##DB += dbExample2.db
##DB += dbSubExample.db
##DB += user.substitutions
##DB += userHost.substitutions

DB += bom_read_control.db
DB += bom_scaler.db
DB += bom_stop_start.db
DB += bom_sum.db


#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_TEMPLATE = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

