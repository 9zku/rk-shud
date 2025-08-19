export interface PlayerStatus {
  health: number
  armour: number
  hunger: number
  thirst: number
  stamina: number
}

export interface VehicleState {
  health: number
  rpm: number
  fuel: number
  seatbelt: boolean
  speed: number
  isInVehicle: boolean
  streetName?: string
  areaName?: string
  direction?: string
}

export * from './config'
