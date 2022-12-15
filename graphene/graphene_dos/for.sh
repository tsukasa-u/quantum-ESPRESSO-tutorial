#!/bin/bash

pw.x < graphene.scf.in > graphene.scf.out

pw.x < graphene.nscf.in > graphene.nscf.out

dos.x < graphene.dos.in > graphene.dos.out