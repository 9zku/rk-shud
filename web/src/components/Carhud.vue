<script setup lang="ts">
import type { VehicleState } from '../types'

const props = defineProps<{
  vehicleState: VehicleState
}>()
</script>

<template>
    <div class="fixed bottom-4 right-4 flex space-x-4">
        <div class="fixed bottom-8 left-4 2k:left-6 2k:bottom-10 4k:left-8 4k:bottom-12 w-minimap-border-w h-minimap-border-h 2k:w-minimap-border-w-2k 2k:h-minimap-border-h-2k 4k:w-minimap-border-w-4k 4k:h-minimap-border-h-4k border border-white">
        </div>
        
        <div class="fixed bottom-carhud-direction-bottom 2k:bottom-carhud-direction-bottom-2k 4k:bottom-carhud-direction-bottom-4k left-carhud-direction-left 2k:left-carhud-direction-left-2k 4k:left-carhud-direction-left-4k text-white text-xs font-medium">
            <div class="text-center">
                <div>{{ props.vehicleState.direction || 'N' }}</div>
            </div>
        </div>
        
        <div class="fixed bottom-carhud-white-box-bottom 2k:bottom-carhud-white-box-bottom-2k 4k:bottom-carhud-white-box-bottom-4k left-carhud-white-box-left 2k:left-carhud-white-box-left-2k 4k:left-carhud-white-box-left-4k flex items-center space-x-2">
            <div class="w-8 h-8 bg-gradient-to-br from-white to-gray-100 border border-gray-200 rounded-md flex items-center justify-center shadow-lg">
                <img src="/img/compass.svg" alt="compass" class="w-5 h-5" />
            </div>
            <div class="text-white text-xs font-medium">
                <div class="mb-1">{{ props.vehicleState.streetName || 'Unknown' }}</div>
                <div class="text-white/80">{{ props.vehicleState.areaName || 'Unknown' }}</div>
            </div>
        </div>
        
        <div class="flex flex-col space-y-2 relative">
            <div class="w-16 h-5 bg-white/90 border-2 border-gray-800/60 rounded-md ml-auto absolute -top-4 right-0 flex items-center justify-center text-xs font-semibold uppercase shadow-lg"
                :class="props.vehicleState.seatbelt ? 'text-black' : 'text-red-500'">BELT</div>
        <div class="absolute -top-8 left-0 text-white">
            <span class="text-2xl font-semibold drop-shadow-sm">{{ Math.round(props.vehicleState.speed || 0).toString().padStart(3, '0') }}</span>
            <span class="ml-1 text-sm opacity-80">MPH</span>
        </div>
            <div class="w-46 h-3 bg-zinc-700 border border-gray-800/50 rounded-sm overflow-hidden shadow-lg">
                <div class="h-full bg-white transition-all duration-300 shadow-lg shadow-white/50"
                    :style="{ width: `${props.vehicleState.rpm || 0}%` }"></div>
            </div>
            <div class="flex space-x-1">
                <div class="w-5 h-2 bg-white/90 transition-all duration-300 rounded-sm shadow-sm" :style="{ background: (props.vehicleState.health || 0) >= 12.5 ? 'white' : 'rgba(255, 255, 255, 0.3)' }"></div>
                <div class="w-5 h-2 bg-white/90 transition-all duration-300 rounded-sm shadow-sm" :style="{ background: (props.vehicleState.health || 0) >= 25 ? 'white' : 'rgba(255, 255, 255, 0.3)' }"></div>
                <div class="w-5 h-2 bg-white/90 transition-all duration-300 rounded-sm shadow-sm" :style="{ background: (props.vehicleState.health || 0) >= 37.5 ? 'white' : 'rgba(255, 255, 255, 0.3)' }"></div>
                <div class="w-5 h-2 bg-white/90 transition-all duration-300 rounded-sm shadow-sm" :style="{ background: (props.vehicleState.health || 0) >= 50 ? 'white' : 'rgba(255, 255, 255, 0.3)' }"></div>
                <div class="w-5 h-2 bg-white/90 transition-all duration-300 rounded-sm shadow-sm" :style="{ background: (props.vehicleState.health || 0) >= 62.5 ? 'white' : 'rgba(255, 255, 255, 0.3)' }"></div>
                <div class="w-5 h-2 bg-white/90 transition-all duration-300 rounded-sm shadow-sm" :style="{ background: (props.vehicleState.health || 0) >= 75 ? 'white' : 'rgba(255, 255, 255, 0.3)' }"></div>
                <div class="w-5 h-2 bg-white/90 transition-all duration-300 rounded-sm shadow-sm" :style="{ background: (props.vehicleState.health || 0) >= 87.5 ? 'white' : 'rgba(255, 255, 255, 0.3)' }"></div>
                <div class="w-5 h-2 bg-white/90 transition-all duration-300 rounded-sm shadow-sm" :style="{ background: (props.vehicleState.health || 0) >= 100 ? 'white' : 'rgba(255, 255, 255, 0.3)' }"></div>
            </div>
        </div>
        <div class="flex items-center">
            <div class="relative w-8 h-8">
                <svg class="w-8 h-8 transform -rotate-90 absolute inset-0" viewBox="0 0 40 40">
                    <circle cx="20" cy="20" r="18" stroke="rgb(82 82 91)" stroke-width="3" fill="rgb(39 39 42)" class="drop-shadow-sm" />
                    <circle cx="20" cy="20" r="18" stroke="orange" stroke-width="3" fill="none"
                        :style="{ 
                            strokeDasharray: `${2 * Math.PI * 18}px`,
                            strokeDashoffset: `${2 * Math.PI * 18 - ((props.vehicleState.fuel || 0) / 100) * (2 * Math.PI * 18)}px`
                        }" class="transition-all duration-300 drop-shadow-sm" />
                </svg>
                <img src="/img/fuel.svg" alt="fuel" class="w-3 h-3 absolute inset-0 m-auto z-10 drop-shadow-sm" />
            </div>
        </div>
    </div>
</template>

<style scoped></style>
