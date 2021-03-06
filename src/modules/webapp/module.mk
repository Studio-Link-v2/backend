#
# module.mk
#
# Copyright (C) 2013-2020 studio-link.de
#

MOD		:= webapp
$(MOD)_SRCS	+= webapp.c account.c contact.c option.c
$(MOD)_SRCS	+= ws_baresip.c ws_contacts.c ws_meter.c ws_calls.c
$(MOD)_SRCS	+= ws_options.c ws_rtaudio.c
$(MOD)_SRCS	+= websocket.c utils.c sessions.c jitter.c
$(MOD)_LFLAGS   += -lm -lFLAC

include mk/mod.mk
