#!/bin/bash

pw.x < graphene.scf.in > graphene.scf.out

pw.x < graphene.nscf.in > graphene.nscf.out

bands.x < graphene.band.in > graphene.band.out