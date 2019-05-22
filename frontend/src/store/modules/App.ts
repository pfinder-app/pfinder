import {IUser} from "@/interfaces/IUser";

export interface IAppState {
  user: IUser|null;
}

const state: IAppState = {
  user: null,
};

const mutations = {
  SET_USER (state: IAppState, user: IUser) {
    state.user = user
  },
};

const actions = {};

export default {
  state,
  mutations,
  actions
}
